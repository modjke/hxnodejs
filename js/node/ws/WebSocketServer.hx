package js.node.ws;
import js.node.events.EventEmitter;
import js.Error;




@:enum abstract WebSocketServerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	var Connection : WebSocketServerEvent<WebSocket->Void> = "connection";
	var Error : WebSocketServerEvent<Error->Void> = "error";	
}

@:jsRequire("ws", "Server")
extern class WebSocketServer extends EventEmitter<WebSocketServer>
{
	public var clients(default, never):Array<WebSocket>;
	public function new(?options:WebSocketServerOptions, callback:Void->Void);
	public function close():Void;
	
}

typedef WebSocketServerOptions = {
	?host:String,
	?port:Int,
	?server:Server,
	//TODO verifyClient:Function,
	//TODO handleProtocols:Function,
	?path:String,
	?noServer:Bool,
	?disableHixie:Bool,
	?clientTracking:Bool,
	//TODO perMessageDeflate:Bool or Object
}