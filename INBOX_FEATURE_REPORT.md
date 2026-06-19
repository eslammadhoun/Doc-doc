# Inbox Feature — Professional Technical Report

**Project:** DocDoc — Flutter Medical Appointment Scheduling App  
**Feature:** Real-Time Messaging / Inbox System  
**Date:** June 19, 2026  
**Author:** Ali Madhoun  
**Total Feature Size:** 1,677 lines of Dart (excluding generated files) | 26 files

---

## 1. Executive Summary

The Inbox feature is a fully functional real-time messaging system built for the DocDoc Flutter medical application. It enables **patient-to-doctor** communication through a three-screen architecture: **Inbox List**, **Conversation Thread**, and **New Message Composer**. The system leverages **Firebase Firestore** for real-time data streaming, **BLoC/Cubit** for state management, and **Freezed** for immutable state modeling. The feature follows clean architecture principles with a unidirectional data flow and proper separation of concerns across data, business logic, and presentation layers.

**Overall Assessment: A- (85/100)** — Production-ready with excellent architecture. Minor cleanup items remain (dead code, naming typo, UI placeholders).

---

## 2. Architecture Overview

### 2.1 Layered Architecture

```
┌─────────────────────────────────────────────────┐
│                   UI LAYER                       │
│  InboxScreen · ConversationScreen · NewMessage   │
│  Widgets: ConversationTile, MessageBubble, etc.  │
├─────────────────────────────────────────────────┤
│              BUSINESS LOGIC LAYER                │
│     InboxCubit · ConversationCubit · NewMsg      │
│     Freezed States · Stream Subscriptions        │
├─────────────────────────────────────────────────┤
│               REPOSITORY LAYER                   │
│     InboxRepo (abstract) → InboxRepoFirebase     │
│     ApiResult<T> wrapping (Success | Failure)    │
├─────────────────────────────────────────────────┤
│              DATA SOURCE LAYER                   │
│           InboxFirebase (Firestore)              │
│     Real-time streams · Batch writes             │
└─────────────────────────────────────────────────┘
```

### 2.2 Data Flow

```
Firestore (real-time listener)
    ↓ Stream<QuerySnapshot>
InboxFirebase (datasource — raw Firestore operations)
    ↓ Stream<List<DocumentSnapshot>>
InboxRepoFirebase (maps to domain models, wraps in ApiResult<T>)
    ↓ ApiResult<Stream<List<ConversationModel>>>
InboxCubit / ConversationCubit (subscribes, emits Freezed state)
    ↓ BlocBuilder / BlocSelector
UI Widgets (rebuild on relevant state changes only)
```

### 2.3 Design Patterns Used

| Pattern | Implementation |
|---------|---------------|
| **Repository** | `InboxRepo` abstract → `InboxRepoFirebase` concrete |
| **BLoC/Cubit** | `InboxCubit`, `ConversationCubit`, `NewMessageCubit` |
| **Freezed Unions** | All state classes + `ApiResult<T>` (Success/Failure) |
| **Dependency Injection** | GetIt (`sl`) — repos as singletons, cubits as factories |
| **Observer/Stream** | Firestore real-time listeners via `StreamSubscription` |
| **Batch Write** | Atomic message delivery to both participants |

---

## 3. Feature Directory Structure

```
lib/features/inbox/
├── data/
│   ├── models/
│   │   ├── conversation_model.dart       (81 lines)
│   │   └── message_model.dart            (37 lines)
│   ├── repos/
│   │   ├── inbox_repo.dart               (102 lines — abstract)
│   │   └── inbox_repo_firebase.dart      (84 lines — implementation)
│   └── services/
│       └── inbox_firebase.dart           (79 lines — Firestore datasource)
│
└── ui/
    ├── inbox/                            [Screen 1: Conversation List]
    │   ├── logic/
    │   │   ├── inbox_cubit.dart          (100 lines)
    │   │   ├── inbox_state.dart          (24 lines)
    │   │   └── inbox_state.freezed.dart  (generated)
    │   ├── widgets/
    │   │   ├── conversation_tile.dart    (99 lines)
    │   │   └── inbox_navbar.dart         (64 lines)
    │   └── inbox_screen.dart             (188 lines)
    │
    ├── conversation/                     [Screen 2: Chat Thread]
    │   ├── logic/
    │   │   ├── conversation_cubit.dart   (97 lines)
    │   │   ├── conversation_state.dart   (18 lines)
    │   │   └── conversation_state.freezed.dart (generated)
    │   ├── widgets/
    │   │   ├── chat_input_bar.dart       (139 lines)
    │   │   ├── chat_thread_navbar.dart   (80 lines)
    │   │   ├── message_bubble.dart       (57 lines)
    │   │   └── session_start_tag.dart    (22 lines)
    │   └── conversation_screen.dart      (95 lines)
    │
    └── new_message/                      [Screen 3: Doctor Selection]
        ├── logic/
        │   ├── new_message_cubit.dart    (76 lines)
        │   ├── new_message_state.dart    (12 lines)
        │   └── new_message_state.freezed.dart (generated)
        ├── widgets/
        │   ├── doctor_list_item.dart     (64 lines)
        │   └── new_message_navbar.dart   (26 lines)
        └── new_message_screen.dart       (133 lines)
```

---

## 4. Data Layer

### 4.1 Firestore Database Schema

```
Users/{userId}/
  conversations/{conversationId}/
    ├── participants: Map<String, ParticipantInfo>
    │     {senderId}: { name, photo, role }
    │     {receiverId}: { name, photo, role }
    ├── lastMessage: String
    ├── lastMessageSenderId: String
    ├── lastMessageAt: Timestamp (server-generated)
    ├── unreadCount: Map<String, int>
    │     {senderId}: 0
    │     {receiverId}: 1+
    │
    └── messages/{messageId}/
          ├── senderId: String
          ├── text: String
          ├── sentAt: Timestamp (server-generated)
          └── status: String (default: 'sent')
```

**Key Design Decisions:**
- **Deterministic Conversation IDs** — `ConversationModel.buildId()` sorts two user IDs alphabetically and concatenates with `_`, ensuring the same pair always produces the same conversation ID regardless of who initiates.
- **Per-User Duplication** — Each user has their own copy of conversation and message documents. This enables isolated unread counts and fast per-user queries without complex Firestore security rules.
- **Server Timestamps** — `FieldValue.serverTimestamp()` ensures consistent ordering regardless of client clock drift.
- **Batch Writes** — `sendMessage()` uses Firestore batch operations to atomically write to both participants' collections, maintaining data consistency.

### 4.2 Domain Models

#### ConversationModel (81 lines)
| Field | Type | Description |
|-------|------|-------------|
| `id` | `String` | Deterministic ID (`user1_user2`) |
| `participants` | `Map<String, ParticipantInfo>` | User details keyed by userId |
| `lastMessage` | `String` | Preview text for conversation list |
| `lastMessageSenderId` | `String` | Who sent the last message |
| `lastMessageAt` | `DateTime?` | Timestamp for sorting |
| `unreadCount` | `Map<String, int>` | Per-user unread badge count |

**Helper Methods:**
- `buildId(userIdA, userIdB)` — Static, deterministic conversation ID builder
- `otherParticipant(currentUserId)` — Returns the other party's `ParticipantInfo`
- `fromSnapshot(DocumentSnapshot)` — Firestore deserialization with Timestamp → DateTime conversion

#### MessageModel (37 lines)
| Field | Type | Description |
|-------|------|-------------|
| `id` | `String` | Firestore document ID |
| `senderId` | `String` | Message author |
| `text` | `String` | Message content |
| `sentAt` | `DateTime?` | Server-generated timestamp |
| `status` | `String` | Default: `'sent'` |

### 4.3 Repository Layer

| Class | Role | Error Handling |
|-------|------|---------------|
| `InboxRepo` (abstract) | Defines contract: `watchConversations`, `watchMessages`, `sendMessage` | Returns `ApiResult<T>` |
| `InboxRepoFirebase` | Concrete implementation wrapping `InboxFirebase` | try-catch → `FirebaesErrorHandler.handle()` |

### 4.4 Firebase Datasource (`InboxFirebase`)

| Method | Description |
|--------|-------------|
| `watchConversations(userId)` | Returns stream from `Users/{userId}/conversations` ordered by `lastMessageAt DESC` |
| `watchMessages(userId, conversationId)` | Streams from `messages` subcollection ordered by `sentAt ASC` |
| `sendMessage(...)` | Batch writes: creates/updates conversation doc + message doc for BOTH participants atomically |

---

## 5. Business Logic Layer

### 5.1 InboxCubit — Conversation List Manager

**Responsibilities:** Watch real-time conversation list, local search/filter.

| Method | Description |
|--------|-------------|
| `watchConversations()` | Subscribes to repo stream, emits loading → success/failure |
| `searchDoctors(query)` | Local filter on `otherParticipant.name` (case-insensitive) |
| `setIsSearching(bool)` | Toggles search mode UI |
| `close()` | Cancels stream subscription |

**State Fields:** `conversations`, `getConversationsStatus`, `isSearching`, `searchResult`, `searchStatus`

### 5.2 ConversationCubit — Chat Thread Manager

**Responsibilities:** Watch messages for a single conversation, send new messages.

| Method | Description |
|--------|-------------|
| `watchMessages()` | Subscribes to message stream for specific conversation |
| `sendMessage(text)` | Delegates to repo with full participant info |
| `changeIsTyping(bool)` | Toggles send/microphone icon |
| `close()` | Cancels message stream |

**Constructor Params:** `currentUserId`, `conversationId`, `receiverId`, `senderInfo`, `receiverInfo` — all injected at navigation time by the router.

### 5.3 NewMessageCubit — Doctor Selection Manager

**Responsibilities:** Fetch doctor list, search, filter by specialization.

| Method | Description |
|--------|-------------|
| `fetchDoctors()` | Loads from `DoctorsRepo.getRecommandedDoctors()`, extracts specializations |
| `searchDoctors(query)` | API-based search with specialization filter |
| `sortDoctors(speciality)` | Filters loaded doctors by selected specialization |

**Cross-Feature Reuse:** Uses `DoctorsRepo` from the home feature — correct design since the doctor list is a shared domain concept.

---

## 6. Presentation Layer

### 6.1 Screen Summary

| Screen | Purpose | Lines | Key Components |
|--------|---------|-------|----------------|
| **InboxScreen** | Conversation list with search | 188 | `InboxNavbar`, `DoctorsSearchBar`, `ConversationTile` list |
| **ConversationScreen** | Active chat thread | 95 | `ChatThreadNavbar`, reversed `ListView`, `ChatInputBar` |
| **NewMessageScreen** | Doctor selection (modal sheet) | 133 | `NewMessageNavbar`, `DoctorsSearchBar`, `DoctorListItem` list |

### 6.2 Widget Inventory

| Widget | Lines | Purpose |
|--------|-------|---------|
| `ConversationTile` | 99 | Conversation preview card (avatar, name, last message, unread badge, timestamp) |
| `InboxNavbar` | 64 | Header with back, title, and "+ New Message" button |
| `ChatInputBar` | 139 | Text input + emoji/attachment/camera icons + send/microphone toggle |
| `ChatThreadNavbar` | 80 | Header with back, receiver name/status, video call button |
| `MessageBubble` | 57 | Left/right aligned message with asymmetric rounded corners |
| `SessionStartTag` | 22 | "Session Start" label at conversation beginning |
| `DoctorListItem` | 64 | Doctor card for new message selection |
| `NewMessageNavbar` | 26 | Close button + "Create New Message" title |

### 6.3 UI/UX Details

- **Message Bubbles:** Blue background + right-aligned for sender; white + left-aligned for receiver. Asymmetric border radius (flat corner on sender side).
- **Unread Badge:** Small blue circle with count on `ConversationTile`, driven by `unreadCount[currentUserId]`.
- **Input Bar:** Dynamically switches between send icon (when typing) and microphone icon (when empty) using `BlocSelector`.
- **New Message Sheet:** Modal bottom sheet constrained to 85% screen height, with doctor search + specialization sort filter.

---

## 7. Routing & Dependency Injection

### 7.1 Navigation Routes

| Route | Arguments | BLoC Provider |
|-------|-----------|---------------|
| `chatThreadScreen` | `currentUserId`, `receiverId`, `receiverName`, `receiverPhoto` | `ConversationCubit` (created inline in router) |
| Inbox tab (main page) | None (tab index 1) | `InboxCubit` (created inline in `MainPage`) |
| New Message Sheet | None (opens as modal) | `NewMessageCubit` (created inline in sheet) |

### 7.2 GetIt Registration

```
InboxFirebase         → Lazy Singleton (Firestore datasource)
InboxRepo             → Lazy Singleton (via InboxRepoFirebase)
InboxCubit            → Factory (fresh per use)
NewMessageCubit       → Factory (fresh per use)
ConversationCubit     → NOT registered (created inline with unique params)
```

---

## 8. Performance Optimizations

| Optimization | Where Applied | Impact |
|-------------|---------------|--------|
| `RepaintBoundary` | ConversationTile, DoctorListItem, MessageBubble | Caches rendered list items, prevents unnecessary repaints |
| `BlocSelector` | ChatInputBar (listens only to `istyping`) | Avoids full rebuilds on unrelated state changes |
| `buildWhen` | ConversationScreen | Rebuilds only when message list or status changes |
| `memCacheWidth/Height` | All avatar images | Limits decoded image memory footprint |
| `ListView.builder` | All list screens | Lazy rendering — only visible items built |
| `CachedNetworkImage` | Avatars in tiles and items | Network caching with placeholder |
| Server-side timestamps | Message ordering | Consistent ordering across devices |
| Stream cancellation | All cubits' `close()` methods | Prevents memory leaks |

---

## 9. Findings & Recommendations

### 9.1 Issues Summary

| # | Severity | Issue | Location | Recommendation |
|---|----------|-------|----------|----------------|
| 1 | Medium | 68 lines of commented-out legacy code | `inbox_repo.dart` lines 1–77 | Delete dead code |
| 2 | Low | Typo: `istyping` should be `isTyping` | `conversation_state.dart` line 16 | Rename + regenerate Freezed |
| 3 | Low | Duplicated ListView logic (~90 lines) | `inbox_screen.dart` lines 65–97 & 134–166 | Extract shared builder method |
| 4 | Low | Emoji/attachment/camera icons non-functional | `chat_input_bar.dart` | Implement or remove placeholders |
| 5 | Low | Video call button is a dead placeholder | `chat_thread_navbar.dart` line 49 | Implement or remove |
| 6 | Low | Hardcoded "Online" status | `chat_thread_navbar.dart` line 14 | Integrate presence system or remove |
| 7 | Info | Local-only search (filters loaded list) | `inbox_cubit.dart` line 60 | Acceptable for < 100 conversations |

### 9.2 Strengths

- **Clean architecture** — Proper separation across data, logic, and UI layers
- **Real-time streaming** — Firestore listeners for live updates
- **Atomic writes** — Batch operations ensure data consistency between participants
- **Null safety** — Excellent use of `?.`, `??`, and nullable types throughout
- **Resource management** — All stream subscriptions properly cancelled in `close()`
- **Cross-feature reuse** — `DoctorsRepo` and `DoctorsSearchBar` shared with home feature
- **Performance-conscious** — RepaintBoundary, BlocSelector, image caching, lazy lists

### 9.3 Improvement Roadmap

| Priority | Enhancement | Effort |
|----------|------------|--------|
| 1 | Clean up dead code and typos (issues #1, #2) | 30 min |
| 2 | Extract duplicated ListView logic (issue #3) | 1 hour |
| 3 | Implement or remove placeholder UI (issues #4, #5) | 2–4 hours |
| 4 | Add online presence tracking (issue #6) | 4–8 hours |
| 5 | Add message read receipts (`status: 'read'`) | 4–6 hours |
| 6 | Add push notifications for new messages | 8–16 hours |
| 7 | Add image/file message support | 8–16 hours |
| 8 | Server-side search for large conversation lists | 4–8 hours |

---

## 10. File-by-File Status

| File | Lines | Status | Notes |
|------|-------|--------|-------|
| `conversation_model.dart` | 81 | Clean | Well-designed with factory constructors |
| `message_model.dart` | 37 | Clean | Proper Firestore serialization |
| `inbox_repo.dart` | 102 | Needs cleanup | 68 lines commented-out dead code |
| `inbox_repo_firebase.dart` | 84 | Clean | Good error wrapping |
| `inbox_firebase.dart` | 79 | Clean | Atomic batch writes |
| `inbox_state.dart` | 24 | Clean | Comprehensive state modeling |
| `inbox_cubit.dart` | 100 | Clean | Proper stream management |
| `conversation_state.dart` | 18 | Minor issue | `istyping` typo |
| `conversation_cubit.dart` | 97 | Clean | Focused and minimal |
| `new_message_state.dart` | 12 | Clean | Simple Freezed union |
| `new_message_cubit.dart` | 76 | Clean | Smart search + filter combo |
| `inbox_screen.dart` | 188 | Needs refactor | Duplicated ListView logic |
| `conversation_screen.dart` | 95 | Clean | Optimized rebuilds |
| `new_message_screen.dart` | 133 | Clean | Proper async/mount checks |
| `conversation_tile.dart` | 99 | Clean | Image caching optimized |
| `inbox_navbar.dart` | 64 | Clean | Reusable nav button |
| `chat_input_bar.dart` | 139 | Has placeholders | Non-functional icon buttons |
| `chat_thread_navbar.dart` | 80 | Has placeholders | Video button + hardcoded status |
| `message_bubble.dart` | 57 | Clean | Proper asymmetric styling |
| `session_start_tag.dart` | 22 | Clean | Simple and focused |
| `doctor_list_item.dart` | 64 | Clean | Image caching optimized |
| `new_message_navbar.dart` | 26 | Clean | Simple header |

---

## 11. Technology Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter (Dart) |
| **State Management** | flutter_bloc (Cubit) |
| **Immutable State** | Freezed + json_serializable |
| **Backend** | Firebase Firestore (real-time streams) |
| **Dependency Injection** | GetIt |
| **Image Caching** | CachedNetworkImage |
| **Responsive Sizing** | flutter_screenutil |
| **Date Formatting** | intl (DateFormat) |
| **Routing** | Named routes with `onGenerateRoute` |

---

*Report generated for portfolio documentation and code review purposes.*
