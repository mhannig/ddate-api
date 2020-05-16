-module(ddate_iface_http_h_errors).

-behaviour(gen_server).

-export([start_link/0]).
-export([handle_request/3]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(SERVER, ?MODULE).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


init(_Args) ->
    {ok, []}.

%%---------------------------------------------------------
%% Interface functions 
%%---------------------------------------------------------

handle_request(Req, Params, Opts) ->
    gen_server:call(?SERVER, {request, Req, Params, Opts}).



%%---------------------------------------------------------
%% Server
%%---------------------------------------------------------

% Process request
handle_call({request, Req, Params, Opts}, _From, State) ->
    % Todo: Invoke callbak in resource behaviour 
    Response = {error, {"Something went wrong..."}},

    {reply, Response, State}.


handle_cast(_, State) -> {noreply, State}.

