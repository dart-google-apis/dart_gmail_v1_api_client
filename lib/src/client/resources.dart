part of gmail_v1_api;

class UsersResource_ {

  final Client _client;

  final UsersDraftsResource_ drafts;
  final UsersHistoryResource_ history;
  final UsersLabelsResource_ labels;
  final UsersMessagesResource_ messages;
  final UsersThreadsResource_ threads;

  UsersResource_(Client client) :
      _client = client,
      drafts = new UsersDraftsResource_(client),
      history = new UsersHistoryResource_(client),
      labels = new UsersLabelsResource_(client),
      messages = new UsersMessagesResource_(client),
      threads = new UsersThreadsResource_(client);
}

class UsersDraftsResource_ {

  final Client _client;

  UsersDraftsResource_(Client client) :
      _client = client;

  /**
   * Creates a new draft with the DRAFT label.
   *
   * [request] - Draft to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Draft> create(Draft request, core.String userId, {core.String content, core.String contentType, core.Map optParams}) {
    var url = "{userId}/drafts";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/drafts";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Draft.fromJson(data));
  }

  /**
   * Immediately and permanently deletes the specified draft. Does not simply trash it.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the draft to delete.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/drafts/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Gets the specified draft.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the draft to retrieve.
   *
   * [format] - The format to return the draft in.
   *   Default: full
   *   Allowed values:
   *     full - 
   *     metadata - 
   *     minimal - 
   *     raw - 
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Draft> get(core.String userId, core.String id, {core.String format, core.Map optParams}) {
    var url = "{userId}/drafts/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (format != null && !["full", "metadata", "minimal", "raw"].contains(format)) {
      paramErrors.add("Allowed values for format: full, metadata, minimal, raw");
    }
    if (format != null) queryParams["format"] = format;
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Draft.fromJson(data));
  }

  /**
   * Lists the drafts in the user's mailbox.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [maxResults] - Maximum number of drafts to return.
   *   Default: 100
   *
   * [pageToken] - Page token to retrieve a specific page of results in the list.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ListDraftsResponse> list(core.String userId, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "{userId}/drafts";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ListDraftsResponse.fromJson(data));
  }

  /**
   * Sends the specified, existing draft to the recipients in the To, Cc, and Bcc headers.
   *
   * [request] - Draft to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> send(Draft request, core.String userId, {core.String content, core.String contentType, core.Map optParams}) {
    var url = "{userId}/drafts/send";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/drafts/send";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Replaces a draft's content.
   *
   * [request] - Draft to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the draft to update.
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Draft> update(Draft request, core.String userId, core.String id, {core.String content, core.String contentType, core.Map optParams}) {
    var url = "{userId}/drafts/{id}";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/drafts/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "PUT", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "PUT", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Draft.fromJson(data));
  }
}

class UsersHistoryResource_ {

  final Client _client;

  UsersHistoryResource_(Client client) :
      _client = client;

  /**
   * Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing historyId).
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [labelId] - Only return messages with a label matching the ID.
   *
   * [maxResults] - The maximum number of history records to return.
   *   Default: 100
   *
   * [pageToken] - Page token to retrieve a specific page of results in the list.
   *
   * [startHistoryId] - Required. Returns history records after the specified startHistoryId. The supplied startHistoryId should be obtained from the historyId of a message, thread, or previous list response. History IDs increase chronologically but are not contiguous with random gaps in between valid IDs. Supplying an invalid or out of date startHistoryId typically returns an HTTP 404 error code. A historyId is typically valid for at least a week, but in some circumstances may be valid for only a few hours. If you receive an HTTP 404 error response, your application should perform a full sync. If you receive no nextPageToken in the response, there are no updates to retrieve and you can store the returned historyId for a future request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ListHistoryResponse> list(core.String userId, {core.String labelId, core.int maxResults, core.String pageToken, core.String startHistoryId, core.Map optParams}) {
    var url = "{userId}/history";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (labelId != null) queryParams["labelId"] = labelId;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (startHistoryId != null) queryParams["startHistoryId"] = startHistoryId;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ListHistoryResponse.fromJson(data));
  }
}

class UsersLabelsResource_ {

  final Client _client;

  UsersLabelsResource_(Client client) :
      _client = client;

  /**
   * Creates a new label.
   *
   * [request] - Label to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Label> create(Label request, core.String userId, {core.Map optParams}) {
    var url = "{userId}/labels";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Label.fromJson(data));
  }

  /**
   * Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the label to delete.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/labels/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Gets the specified label.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the label to retrieve.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Label> get(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/labels/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Label.fromJson(data));
  }

  /**
   * Lists all labels in the user's mailbox.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ListLabelsResponse> list(core.String userId, {core.Map optParams}) {
    var url = "{userId}/labels";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ListLabelsResponse.fromJson(data));
  }

  /**
   * Updates the specified label. This method supports patch semantics.
   *
   * [request] - Label to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the label to update.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Label> patch(Label request, core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/labels/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PATCH", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Label.fromJson(data));
  }

  /**
   * Updates the specified label.
   *
   * [request] - Label to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the label to update.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Label> update(Label request, core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/labels/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PUT", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Label.fromJson(data));
  }
}

class UsersMessagesResource_ {

  final Client _client;

  final UsersMessagesAttachmentsResource_ attachments;

  UsersMessagesResource_(Client client) :
      _client = client,
      attachments = new UsersMessagesAttachmentsResource_(client);

  /**
   * Immediately and permanently deletes the specified message. This operation cannot be undone. Prefer messages.trash instead.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the message to delete.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/messages/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Gets the specified message.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the message to retrieve.
   *
   * [format] - The format to return the message in.
   *   Default: full
   *   Allowed values:
   *     full - 
   *     metadata - 
   *     minimal - 
   *     raw - 
   *
   * [metadataHeaders] - When given and format is METADATA, only include headers specified.
   *   Repeated values: allowed
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> get(core.String userId, core.String id, {core.String format, core.List<core.String> metadataHeaders, core.Map optParams}) {
    var url = "{userId}/messages/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (format != null && !["full", "metadata", "minimal", "raw"].contains(format)) {
      paramErrors.add("Allowed values for format: full, metadata, minimal, raw");
    }
    if (format != null) queryParams["format"] = format;
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (metadataHeaders != null) queryParams["metadataHeaders"] = metadataHeaders;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Imports a message into only this user's mailbox, with standard email delivery scanning and classification similar to receiving via SMTP. Does not send a message.
   *
   * [request] - Message to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [internalDateSource] - Source for Gmail's internal date of the message.
   *   Allowed values:
   *     dateHeader - 
   *     receivedTime - 
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> import(Message request, core.String userId, {core.String content, core.String contentType, core.String internalDateSource, core.Map optParams}) {
    var url = "{userId}/messages/import";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/messages/import";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (internalDateSource != null && !["dateHeader", "receivedTime"].contains(internalDateSource)) {
      paramErrors.add("Allowed values for internalDateSource: dateHeader, receivedTime");
    }
    if (internalDateSource != null) queryParams["internalDateSource"] = internalDateSource;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Directly inserts a message into only this user's mailbox similar to IMAP APPEND, bypassing most scanning and classification. Does not send a message.
   *
   * [request] - Message to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [internalDateSource] - Source for Gmail's internal date of the message.
   *   Allowed values:
   *     dateHeader - 
   *     receivedTime - 
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> insert(Message request, core.String userId, {core.String content, core.String contentType, core.String internalDateSource, core.Map optParams}) {
    var url = "{userId}/messages";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/messages";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (internalDateSource != null && !["dateHeader", "receivedTime"].contains(internalDateSource)) {
      paramErrors.add("Allowed values for internalDateSource: dateHeader, receivedTime");
    }
    if (internalDateSource != null) queryParams["internalDateSource"] = internalDateSource;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Lists the messages in the user's mailbox.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [includeSpamTrash] - Include messages from SPAM and TRASH in the results.
   *   Default: false
   *
   * [labelIds] - Only return messages with labels that match all of the specified label IDs.
   *   Repeated values: allowed
   *
   * [maxResults] - Maximum number of messages to return.
   *   Default: 100
   *
   * [pageToken] - Page token to retrieve a specific page of results in the list.
   *
   * [q] - Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread".
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ListMessagesResponse> list(core.String userId, {core.bool includeSpamTrash, core.List<core.String> labelIds, core.int maxResults, core.String pageToken, core.String q, core.Map optParams}) {
    var url = "{userId}/messages";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (includeSpamTrash != null) queryParams["includeSpamTrash"] = includeSpamTrash;
    if (labelIds != null) queryParams["labelIds"] = labelIds;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (q != null) queryParams["q"] = q;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ListMessagesResponse.fromJson(data));
  }

  /**
   * Modifies the labels on the specified message.
   *
   * [request] - ModifyMessageRequest to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the message to modify.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> modify(ModifyMessageRequest request, core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/messages/{id}/modify";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Sends the specified message to the recipients in the To, Cc, and Bcc headers.
   *
   * [request] - Message to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [content] - Base64 Data of the file content to be uploaded
   *
   * [contentType] - MimeType of the file to be uploaded
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> send(Message request, core.String userId, {core.String content, core.String contentType, core.Map optParams}) {
    var url = "{userId}/messages/send";
    var uploadUrl = "/upload/gmail/v1/users/{userId}/messages/send";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    if (content != null) {
      response = _client.upload(uploadUrl, "POST", request.toString(), content, contentType, urlParams: urlParams, queryParams: queryParams);
    } else {
      response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    }
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Moves the specified message to the trash.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the message to Trash.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> trash(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/messages/{id}/trash";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Message.fromJson(data));
  }

  /**
   * Removes the specified message from the trash.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the message to remove from Trash.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Message> untrash(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/messages/{id}/untrash";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Message.fromJson(data));
  }
}

class UsersMessagesAttachmentsResource_ {

  final Client _client;

  UsersMessagesAttachmentsResource_(Client client) :
      _client = client;

  /**
   * Gets the specified message attachment.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [messageId] - The ID of the message containing the attachment.
   *
   * [id] - The ID of the attachment.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MessagePartBody> get(core.String userId, core.String messageId, core.String id, {core.Map optParams}) {
    var url = "{userId}/messages/{messageId}/attachments/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (messageId == null) paramErrors.add("messageId is required");
    if (messageId != null) urlParams["messageId"] = messageId;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MessagePartBody.fromJson(data));
  }
}

class UsersThreadsResource_ {

  final Client _client;

  UsersThreadsResource_(Client client) :
      _client = client;

  /**
   * Immediately and permanently deletes the specified thread. This operation cannot be undone. Prefer threads.trash instead.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - ID of the Thread to delete.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/threads/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "DELETE", urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Gets the specified thread.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the thread to retrieve.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Thread> get(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/threads/{id}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Thread.fromJson(data));
  }

  /**
   * Lists the threads in the user's mailbox.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [includeSpamTrash] - Include threads from SPAM and TRASH in the results.
   *   Default: false
   *
   * [labelIds] - Only return threads with labels that match all of the specified label IDs.
   *   Repeated values: allowed
   *
   * [maxResults] - Maximum number of threads to return.
   *   Default: 100
   *
   * [pageToken] - Page token to retrieve a specific page of results in the list.
   *
   * [q] - Only return threads matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread".
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ListThreadsResponse> list(core.String userId, {core.bool includeSpamTrash, core.List<core.String> labelIds, core.int maxResults, core.String pageToken, core.String q, core.Map optParams}) {
    var url = "{userId}/threads";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (includeSpamTrash != null) queryParams["includeSpamTrash"] = includeSpamTrash;
    if (labelIds != null) queryParams["labelIds"] = labelIds;
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (q != null) queryParams["q"] = q;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ListThreadsResponse.fromJson(data));
  }

  /**
   * Modifies the labels applied to the thread. This applies to all messages in the thread.
   *
   * [request] - ModifyThreadRequest to send in this request
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the thread to modify.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Thread> modify(ModifyThreadRequest request, core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/threads/{id}/modify";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Thread.fromJson(data));
  }

  /**
   * Moves the specified thread to the trash.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the thread to Trash.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Thread> trash(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/threads/{id}/trash";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Thread.fromJson(data));
  }

  /**
   * Removes the specified thread from the trash.
   *
   * [userId] - The user's email address. The special value me can be used to indicate the authenticated user.
   *   Default: me
   *
   * [id] - The ID of the thread to remove from Trash.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Thread> untrash(core.String userId, core.String id, {core.Map optParams}) {
    var url = "{userId}/threads/{id}/untrash";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (id == null) paramErrors.add("id is required");
    if (id != null) urlParams["id"] = id;
    if (userId == null) paramErrors.add("userId is required");
    if (userId != null) urlParams["userId"] = userId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Thread.fromJson(data));
  }
}

