package  
{
	import net.flashpunk.Entity;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.net.XMLSocket;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Greentuzi
	 */
	public class Util extends Entity
	{
		private var xmlSocket:XMLSocket;	
		private static var instance:Util = null;
		public static function getInstance():Util
		{
			if (instance == null)
				return instance = new Util();
			return instance;
		}
		public function Util() 
		{
			xmlSocket = new XMLSocket();
			xmlSocket.addEventListener(Event.CONNECT, onConnect);
			
			xmlSocket.addEventListener(DataEvent.DATA, onData);
			try{
				xmlSocket.connect("172.18.159.243", 8765);
			}
			catch (e:Error)
			{
				trace(e.getStackTrace());
			}
			
		}
		
		public function send(s:String):void
		{
			xmlSocket.send(s);
		}
		private function onConnect (event:Event) :void 
		{

		}
		
		private function onData(event:DataEvent): void {             
			if (event.data == "") return;
			var string:String = event.data;
			var array:Array = string.split("##");
			switch(array[0])
			{
				case "242":
					trace("Hello");
					GamePlay.getInstance().receive(array[2]);
			}
		}
	}

}