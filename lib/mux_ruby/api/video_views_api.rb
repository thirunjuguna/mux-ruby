=begin
# Mux Ruby - Copyright 2019 Mux Inc.
# NOTE: This file is auto generated. Do not edit this file manually.
=end

require 'uri'

module MuxRuby
  class VideoViewsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get a Video View
    # Returns the details of a video view 
    # @param video_view_id ID of the Video View
    # @param [Hash] opts the optional parameters
    # @return [VideoViewResponse]
    def get_video_view(video_view_id, opts = {})
      data, _status_code, _headers = get_video_view_with_http_info(video_view_id, opts)
      data
    end

    # Get a Video View
    # Returns the details of a video view 
    # @param video_view_id ID of the Video View
    # @param [Hash] opts the optional parameters
    # @return [Array<(VideoViewResponse, Fixnum, Hash)>] VideoViewResponse data, response status code and response headers
    def get_video_view_with_http_info(video_view_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VideoViewsApi.get_video_view ...'
      end
      # verify the required parameter 'video_view_id' is set
      if @api_client.config.client_side_validation && video_view_id.nil?
        fail ArgumentError, "Missing the required parameter 'video_view_id' when calling VideoViewsApi.get_video_view"
      end
      # resource path
      local_var_path = '/data/v1/video-views/{VIDEO_VIEW_ID}'.sub('{' + 'VIDEO_VIEW_ID' + '}', video_view_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['accessToken']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'VideoViewResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VideoViewsApi#get_video_view\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Video Views
    # Returns a list of video views 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of items to include in the response (default to 25)
    # @option opts [Integer] :page Offset by this many pages, of the size of &#x60;limit&#x60; (default to 1)
    # @option opts [String] :viewer_id Viewer ID to filter results by. This value may be provided by the integration, or may be created by Mux.
    # @option opts [Integer] :error_id Filter video views by the provided error ID (as returned in the error_type_id field in the list video views endpoint). If you provide any as the error ID, this will filter the results to those with any error.
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US).  Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600    * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [ListVideoViewsResponse]
    def list_video_views(opts = {})
      data, _status_code, _headers = list_video_views_with_http_info(opts)
      data
    end

    # List Video Views
    # Returns a list of video views 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of items to include in the response
    # @option opts [Integer] :page Offset by this many pages, of the size of &#x60;limit&#x60;
    # @option opts [String] :viewer_id Viewer ID to filter results by. This value may be provided by the integration, or may be created by Mux.
    # @option opts [Integer] :error_id Filter video views by the provided error ID (as returned in the error_type_id field in the list video views endpoint). If you provide any as the error ID, this will filter the results to those with any error.
    # @option opts [String] :order_direction Sort order.
    # @option opts [Array<String>] :filters Filter key:value pairs. Must be provided as an array query string parameter (e.g. filters[]&#x3D;operating_system:windows&amp;filters[]&#x3D;country:US).  Possible filter names are the same as returned by the List Filters endpoint. 
    # @option opts [Array<String>] :timeframe Timeframe window to limit results by. Must be provided as an array query string parameter (e.g. timeframe[]&#x3D;). Accepted formats are...   * array of epoch timestamps e.g. timeframe[]&#x3D;1498867200&amp;timeframe[]&#x3D;1498953600    * duration string e.g. timeframe[]&#x3D;24:hours or timeframe[]&#x3D;7:days. 
    # @return [Array<(ListVideoViewsResponse, Fixnum, Hash)>] ListVideoViewsResponse data, response status code and response headers
    def list_video_views_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VideoViewsApi.list_video_views ...'
      end
      if @api_client.config.client_side_validation && opts[:'order_direction'] && !['asc', 'desc'].include?(opts[:'order_direction'])
        fail ArgumentError, 'invalid value for "order_direction", must be one of asc, desc'
      end
      # resource path
      local_var_path = '/data/v1/video-views'

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'viewer_id'] = opts[:'viewer_id'] if !opts[:'viewer_id'].nil?
      query_params[:'error_id'] = opts[:'error_id'] if !opts[:'error_id'].nil?
      query_params[:'order_direction'] = opts[:'order_direction'] if !opts[:'order_direction'].nil?
      query_params[:'filters[]'] = @api_client.build_collection_param(opts[:'filters'], :multi) if !opts[:'filters'].nil?
      query_params[:'timeframe[]'] = @api_client.build_collection_param(opts[:'timeframe'], :multi) if !opts[:'timeframe'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['accessToken']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListVideoViewsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VideoViewsApi#list_video_views\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
