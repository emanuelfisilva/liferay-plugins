<%
/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ include file="/init.jsp" %>

<%
PortletPreferences preferences = renderRequest.getPreferences();

if (Validator.isNotNull(portletResource)) {
	preferences = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

String childArticlesDisplayStyle = preferences.getValue("child-articles-display-style", "abstract");
boolean enableArticleAssetCategories = GetterUtil.getBoolean(preferences.getValue("enable-article-asset-categories", null), true);
boolean enableArticleAssetTags = GetterUtil.getBoolean(preferences.getValue("enable-article-asset-tags", null), true);
boolean enableArticleRatings = GetterUtil.getBoolean(preferences.getValue("enable-article-ratings", null));
boolean enableArticleComments = GetterUtil.getBoolean(preferences.getValue("enable-article-comments", null), true);
boolean enableArticleCommentRatings = GetterUtil.getBoolean(preferences.getValue("enable-article-comment-ratings", null));

String selectionMethod = preferences.getValue("selection-method", "group");
long[] resourcePrimKeys = GetterUtil.getLongValues(preferences.getValues("resource-prim-keys", null));

boolean allArticles = GetterUtil.getBoolean(preferences.getValue("all-articles", null), true);
String orderByColumn = preferences.getValue("order-by-column", "modified-date");
boolean orderByAscending = GetterUtil.getBoolean(preferences.getValue("order-by-ascending", null));

boolean assetEntryQueryContains = GetterUtil.getBoolean(preferences.getValue("asset-entry-query-contains", null), true);
boolean assetEntryQueryAndOperator = GetterUtil.getBoolean(preferences.getValue("asset-entry-query-and-operator", null));
String assetEntryQueryName = preferences.getValue("asset-entry-query-name", "asset-categories");
long[] assetCategoryIds = GetterUtil.getLongValues(preferences.getValues("asset-category-ids", null));
String[] assetTagNames = preferences.getValues("asset-tag-names", new String[0]);

int rssDelta = GetterUtil.getInteger(preferences.getValue("rss-delta", StringPool.BLANK), SearchContainer.DEFAULT_DELTA);
String rssDisplayStyle = preferences.getValue("rss-display-style", RSSUtil.DISPLAY_STYLE_FULL_CONTENT);
String rssFormat = preferences.getValue("rss-format", "atom10");

String rssFormatType = RSSUtil.getFormatType(rssFormat);
double rssFormatVersion = RSSUtil.getFormatVersion(rssFormat);
%>