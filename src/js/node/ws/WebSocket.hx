package js.node.ws;
import haxe.Constraints.Function;
import js.Error;
import js.html.ArrayBufferView;
import js.html.DataView;
import js.node.events.EventEmitter;


typedef WebSocketOptions = {
	//TODO
}

typedef MessageFlags = {
	?binary:Bool
}

@:enum abstract WebSocketEvent<T:Function>(Event<T>) to Event<T> {
	var Error:WebSocketEvent<Error->Void> = "error";
	var Close:WebSocketEvent<Int->String->Void> = "close";
	var Message:WebSocketEvent<Dynamic->MessageFlags->Void> = "message";
}

@:jsRequire("ws", "WebSocket")
extern class WebSocket extends EventEmitter<WebSocket>
{
	public var bytesReceived(default, never):Int;	
	public function new(address:String, ?protocols:Array<String>, ?options:WebSocketOptions);
	@:overload(function (data:ArrayBufferView, flags:MessageFlags):Void { } )
	@:overload(function (data:js.node.Buffer, flags:MessageFlags):Void { } )
	public function send(data:String):Void;
}