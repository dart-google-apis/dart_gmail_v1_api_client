part of gmail_v1_api;

/** A draft email in the user's mailbox. */
class Draft {

  /** The immutable ID of the draft. */
  core.String id;

  /** The message content of the draft. */
  Message message;

  /** Create new Draft from JSON data */
  Draft.fromJson(core.Map json) {
    if (json.containsKey("id")) {
      id = json["id"];
    }
    if (json.containsKey("message")) {
      message = new Message.fromJson(json["message"]);
    }
  }

  /** Create JSON Object for Draft */
  core.Map toJson() {
    var output = new core.Map();

    if (id != null) {
      output["id"] = id;
    }
    if (message != null) {
      output["message"] = message.toJson();
    }

    return output;
  }

  /** Return String representation of Draft */
  core.String toString() => JSON.encode(this.toJson());

}

/** A record of a change to the user's mailbox. Each history contains a list of the messages that were affected by this change. */
class History {

  /** The mailbox sequence ID. */
  core.String id;

  /** The messages that changed in this history record. */
  core.List<Message> messages;

  /** Create new History from JSON data */
  History.fromJson(core.Map json) {
    if (json.containsKey("id")) {
      id = json["id"];
    }
    if (json.containsKey("messages")) {
      messages = json["messages"].map((messagesItem) => new Message.fromJson(messagesItem)).toList();
    }
  }

  /** Create JSON Object for History */
  core.Map toJson() {
    var output = new core.Map();

    if (id != null) {
      output["id"] = id;
    }
    if (messages != null) {
      output["messages"] = messages.map((messagesItem) => messagesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of History */
  core.String toString() => JSON.encode(this.toJson());

}

/** Labels are used to categorize messages and threads within the user's mailbox. */
class Label {

  /** The immutable ID of the label. */
  core.String id;

  /** The visibility of the label in the label list in the Gmail web interface. */
  core.String labelListVisibility;

  /** The visibility of the label in the message list in the Gmail web interface. */
  core.String messageListVisibility;

  /** The display name of the label. */
  core.String name;

  /** The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads. */
  core.String type;

  /** Create new Label from JSON data */
  Label.fromJson(core.Map json) {
    if (json.containsKey("id")) {
      id = json["id"];
    }
    if (json.containsKey("labelListVisibility")) {
      labelListVisibility = json["labelListVisibility"];
    }
    if (json.containsKey("messageListVisibility")) {
      messageListVisibility = json["messageListVisibility"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
  }

  /** Create JSON Object for Label */
  core.Map toJson() {
    var output = new core.Map();

    if (id != null) {
      output["id"] = id;
    }
    if (labelListVisibility != null) {
      output["labelListVisibility"] = labelListVisibility;
    }
    if (messageListVisibility != null) {
      output["messageListVisibility"] = messageListVisibility;
    }
    if (name != null) {
      output["name"] = name;
    }
    if (type != null) {
      output["type"] = type;
    }

    return output;
  }

  /** Return String representation of Label */
  core.String toString() => JSON.encode(this.toJson());

}

class ListDraftsResponse {

  /** List of drafts. */
  core.List<Draft> drafts;

  /** Token to retrieve the next page of results in the list. */
  core.String nextPageToken;

  /** Estimated total number of results. */
  core.int resultSizeEstimate;

  /** Create new ListDraftsResponse from JSON data */
  ListDraftsResponse.fromJson(core.Map json) {
    if (json.containsKey("drafts")) {
      drafts = json["drafts"].map((draftsItem) => new Draft.fromJson(draftsItem)).toList();
    }
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
    if (json.containsKey("resultSizeEstimate")) {
      resultSizeEstimate = json["resultSizeEstimate"];
    }
  }

  /** Create JSON Object for ListDraftsResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (drafts != null) {
      output["drafts"] = drafts.map((draftsItem) => draftsItem.toJson()).toList();
    }
    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }
    if (resultSizeEstimate != null) {
      output["resultSizeEstimate"] = resultSizeEstimate;
    }

    return output;
  }

  /** Return String representation of ListDraftsResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class ListHistoryResponse {

  /** List of history records. */
  core.List<History> history;

  /** The ID of the mailbox's current history record. */
  core.String historyId;

  /** Page token to retrieve the next page of results in the list. */
  core.String nextPageToken;

  /** Create new ListHistoryResponse from JSON data */
  ListHistoryResponse.fromJson(core.Map json) {
    if (json.containsKey("history")) {
      history = json["history"].map((historyItem) => new History.fromJson(historyItem)).toList();
    }
    if (json.containsKey("historyId")) {
      historyId = json["historyId"];
    }
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
  }

  /** Create JSON Object for ListHistoryResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (history != null) {
      output["history"] = history.map((historyItem) => historyItem.toJson()).toList();
    }
    if (historyId != null) {
      output["historyId"] = historyId;
    }
    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }

    return output;
  }

  /** Return String representation of ListHistoryResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class ListLabelsResponse {

  /** List of labels. */
  core.List<Label> labels;

  /** Create new ListLabelsResponse from JSON data */
  ListLabelsResponse.fromJson(core.Map json) {
    if (json.containsKey("labels")) {
      labels = json["labels"].map((labelsItem) => new Label.fromJson(labelsItem)).toList();
    }
  }

  /** Create JSON Object for ListLabelsResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (labels != null) {
      output["labels"] = labels.map((labelsItem) => labelsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of ListLabelsResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class ListMessagesResponse {

  /** List of messages. */
  core.List<Message> messages;

  /** Token to retrieve the next page of results in the list. */
  core.String nextPageToken;

  /** Estimated total number of results. */
  core.int resultSizeEstimate;

  /** Create new ListMessagesResponse from JSON data */
  ListMessagesResponse.fromJson(core.Map json) {
    if (json.containsKey("messages")) {
      messages = json["messages"].map((messagesItem) => new Message.fromJson(messagesItem)).toList();
    }
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
    if (json.containsKey("resultSizeEstimate")) {
      resultSizeEstimate = json["resultSizeEstimate"];
    }
  }

  /** Create JSON Object for ListMessagesResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (messages != null) {
      output["messages"] = messages.map((messagesItem) => messagesItem.toJson()).toList();
    }
    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }
    if (resultSizeEstimate != null) {
      output["resultSizeEstimate"] = resultSizeEstimate;
    }

    return output;
  }

  /** Return String representation of ListMessagesResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class ListThreadsResponse {

  /** Page token to retrieve the next page of results in the list. */
  core.String nextPageToken;

  /** Estimated total number of results. */
  core.int resultSizeEstimate;

  /** List of threads. */
  core.List<Thread> threads;

  /** Create new ListThreadsResponse from JSON data */
  ListThreadsResponse.fromJson(core.Map json) {
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
    if (json.containsKey("resultSizeEstimate")) {
      resultSizeEstimate = json["resultSizeEstimate"];
    }
    if (json.containsKey("threads")) {
      threads = json["threads"].map((threadsItem) => new Thread.fromJson(threadsItem)).toList();
    }
  }

  /** Create JSON Object for ListThreadsResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }
    if (resultSizeEstimate != null) {
      output["resultSizeEstimate"] = resultSizeEstimate;
    }
    if (threads != null) {
      output["threads"] = threads.map((threadsItem) => threadsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of ListThreadsResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** An email message. */
class Message {

  /** The ID of the last history record that modified this message. */
  core.String historyId;

  /** The immutable ID of the message. */
  core.String id;

  /** List of IDs of labels applied to this message. */
  core.List<core.String> labelIds;

  /** The parsed email structure in the message parts. */
  MessagePart payload;

  /** The entire email message in an RFC 2822 formatted and URL-safe base64 encoded string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied. */
  core.String raw;

  /** Estimated size in bytes of the message. */
  core.int sizeEstimate;

  /** A short part of the message text. */
  core.String snippet;

  /** The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met: 
- The requested threadId must be specified on the Message or Draft.Message you supply with your request. 
- The References and In-Reply-To headers must be set in compliance with the <a href="https://tools.ietf.org/html/rfc2822"RFC 2822 standard. 
- The Subject headers must match. */
  core.String threadId;

  /** Create new Message from JSON data */
  Message.fromJson(core.Map json) {
    if (json.containsKey("historyId")) {
      historyId = json["historyId"];
    }
    if (json.containsKey("id")) {
      id = json["id"];
    }
    if (json.containsKey("labelIds")) {
      labelIds = json["labelIds"].toList();
    }
    if (json.containsKey("payload")) {
      payload = new MessagePart.fromJson(json["payload"]);
    }
    if (json.containsKey("raw")) {
      raw = json["raw"];
    }
    if (json.containsKey("sizeEstimate")) {
      sizeEstimate = json["sizeEstimate"];
    }
    if (json.containsKey("snippet")) {
      snippet = json["snippet"];
    }
    if (json.containsKey("threadId")) {
      threadId = json["threadId"];
    }
  }

  /** Create JSON Object for Message */
  core.Map toJson() {
    var output = new core.Map();

    if (historyId != null) {
      output["historyId"] = historyId;
    }
    if (id != null) {
      output["id"] = id;
    }
    if (labelIds != null) {
      output["labelIds"] = labelIds.toList();
    }
    if (payload != null) {
      output["payload"] = payload.toJson();
    }
    if (raw != null) {
      output["raw"] = raw;
    }
    if (sizeEstimate != null) {
      output["sizeEstimate"] = sizeEstimate;
    }
    if (snippet != null) {
      output["snippet"] = snippet;
    }
    if (threadId != null) {
      output["threadId"] = threadId;
    }

    return output;
  }

  /** Return String representation of Message */
  core.String toString() => JSON.encode(this.toJson());

}

/** A single MIME message part. */
class MessagePart {

  /** The message part body for this part, which may be empty for container MIME message parts. */
  MessagePartBody body;

  /** The filename of the attachment. Only present if this message part represents an attachment. */
  core.String filename;

  /** List of headers on this message part. For the top-level message part, representing the entire message payload, it will contain the standard RFC 2822 email headers such as To, From, and Subject. */
  core.List<MessagePartHeader> headers;

  /** The MIME type of the message part. */
  core.String mimeType;

  /** The immutable ID of the message part. */
  core.String partId;

  /** The child MIME message parts of this part. This only applies to container MIME message parts, for example multipart/*. For non- container MIME message part types, such as text/plain, this field is empty. For more information, see RFC 1521. */
  core.List<MessagePart> parts;

  /** Create new MessagePart from JSON data */
  MessagePart.fromJson(core.Map json) {
    if (json.containsKey("body")) {
      body = new MessagePartBody.fromJson(json["body"]);
    }
    if (json.containsKey("filename")) {
      filename = json["filename"];
    }
    if (json.containsKey("headers")) {
      headers = json["headers"].map((headersItem) => new MessagePartHeader.fromJson(headersItem)).toList();
    }
    if (json.containsKey("mimeType")) {
      mimeType = json["mimeType"];
    }
    if (json.containsKey("partId")) {
      partId = json["partId"];
    }
    if (json.containsKey("parts")) {
      parts = json["parts"].map((partsItem) => new MessagePart.fromJson(partsItem)).toList();
    }
  }

  /** Create JSON Object for MessagePart */
  core.Map toJson() {
    var output = new core.Map();

    if (body != null) {
      output["body"] = body.toJson();
    }
    if (filename != null) {
      output["filename"] = filename;
    }
    if (headers != null) {
      output["headers"] = headers.map((headersItem) => headersItem.toJson()).toList();
    }
    if (mimeType != null) {
      output["mimeType"] = mimeType;
    }
    if (partId != null) {
      output["partId"] = partId;
    }
    if (parts != null) {
      output["parts"] = parts.map((partsItem) => partsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of MessagePart */
  core.String toString() => JSON.encode(this.toJson());

}

/** The body of a single MIME message part. */
class MessagePartBody {

  /** When present, contains the ID of an external attachment that can be retrieved in a separate messages.attachments.get request. When not present, the entire content of the message part body is contained in the data field. */
  core.String attachmentId;

  /** The body data of a MIME message part. May be empty for MIME container types that have no message body or when the body data is sent as a separate attachment. An attachment ID is present if the body data is contained in a separate attachment. */
  core.String data;

  /** Total number of bytes in the body of the message part. */
  core.int size;

  /** Create new MessagePartBody from JSON data */
  MessagePartBody.fromJson(core.Map json) {
    if (json.containsKey("attachmentId")) {
      attachmentId = json["attachmentId"];
    }
    if (json.containsKey("data")) {
      data = json["data"];
    }
    if (json.containsKey("size")) {
      size = json["size"];
    }
  }

  /** Create JSON Object for MessagePartBody */
  core.Map toJson() {
    var output = new core.Map();

    if (attachmentId != null) {
      output["attachmentId"] = attachmentId;
    }
    if (data != null) {
      output["data"] = data;
    }
    if (size != null) {
      output["size"] = size;
    }

    return output;
  }

  /** Return String representation of MessagePartBody */
  core.String toString() => JSON.encode(this.toJson());

}

class MessagePartHeader {

  /** The name of the header before the : separator. For example, To. */
  core.String name;

  /** The value of the header after the : separator. For example, someuser@example.com. */
  core.String value;

  /** Create new MessagePartHeader from JSON data */
  MessagePartHeader.fromJson(core.Map json) {
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("value")) {
      value = json["value"];
    }
  }

  /** Create JSON Object for MessagePartHeader */
  core.Map toJson() {
    var output = new core.Map();

    if (name != null) {
      output["name"] = name;
    }
    if (value != null) {
      output["value"] = value;
    }

    return output;
  }

  /** Return String representation of MessagePartHeader */
  core.String toString() => JSON.encode(this.toJson());

}

class ModifyMessageRequest {

  /** A list of IDs of labels to add to this message. */
  core.List<core.String> addLabelIds;

  /** A list IDs of labels to remove from this message. */
  core.List<core.String> removeLabelIds;

  /** Create new ModifyMessageRequest from JSON data */
  ModifyMessageRequest.fromJson(core.Map json) {
    if (json.containsKey("addLabelIds")) {
      addLabelIds = json["addLabelIds"].toList();
    }
    if (json.containsKey("removeLabelIds")) {
      removeLabelIds = json["removeLabelIds"].toList();
    }
  }

  /** Create JSON Object for ModifyMessageRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (addLabelIds != null) {
      output["addLabelIds"] = addLabelIds.toList();
    }
    if (removeLabelIds != null) {
      output["removeLabelIds"] = removeLabelIds.toList();
    }

    return output;
  }

  /** Return String representation of ModifyMessageRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class ModifyThreadRequest {

  /** A list of IDs of labels to add to this thread. */
  core.List<core.String> addLabelIds;

  /** A list of IDs of labels to remove from this thread. */
  core.List<core.String> removeLabelIds;

  /** Create new ModifyThreadRequest from JSON data */
  ModifyThreadRequest.fromJson(core.Map json) {
    if (json.containsKey("addLabelIds")) {
      addLabelIds = json["addLabelIds"].toList();
    }
    if (json.containsKey("removeLabelIds")) {
      removeLabelIds = json["removeLabelIds"].toList();
    }
  }

  /** Create JSON Object for ModifyThreadRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (addLabelIds != null) {
      output["addLabelIds"] = addLabelIds.toList();
    }
    if (removeLabelIds != null) {
      output["removeLabelIds"] = removeLabelIds.toList();
    }

    return output;
  }

  /** Return String representation of ModifyThreadRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** A collection of messages representing a conversation. */
class Thread {

  /** The ID of the last history record that modified this thread. */
  core.String historyId;

  /** The unique ID of the thread. */
  core.String id;

  /** The list of messages in the thread. */
  core.List<Message> messages;

  /** A short part of the message text. */
  core.String snippet;

  /** Create new Thread from JSON data */
  Thread.fromJson(core.Map json) {
    if (json.containsKey("historyId")) {
      historyId = json["historyId"];
    }
    if (json.containsKey("id")) {
      id = json["id"];
    }
    if (json.containsKey("messages")) {
      messages = json["messages"].map((messagesItem) => new Message.fromJson(messagesItem)).toList();
    }
    if (json.containsKey("snippet")) {
      snippet = json["snippet"];
    }
  }

  /** Create JSON Object for Thread */
  core.Map toJson() {
    var output = new core.Map();

    if (historyId != null) {
      output["historyId"] = historyId;
    }
    if (id != null) {
      output["id"] = id;
    }
    if (messages != null) {
      output["messages"] = messages.map((messagesItem) => messagesItem.toJson()).toList();
    }
    if (snippet != null) {
      output["snippet"] = snippet;
    }

    return output;
  }

  /** Return String representation of Thread */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
