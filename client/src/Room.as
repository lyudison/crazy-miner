package  
{
	/**
	 * ...
	 * @author Lyudison
	 */
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	 
	public class Room extends World
	{
		private var readyBtn1:Button;
		private var readyBtn2:Button;
		private var name1:TextDisplay;
		private var name2:TextDisplay;
		private var player1:ImageDisplay;
		private var player2:ImageDisplay;
		
		public function Room() 
		{
			initEntities();
			addEntities();
		}
		
		private function initEntities():void {
			readyBtn1 = new Button(Config.READY_BUTTON);
			readyBtn2 = new Button(Config.READY_BUTTON);
			readyBtn1.moveTo(200, 500);
			readyBtn2.moveTo(500, 500);
			
			name1 = new TextDisplay("player1");
			name2 = new TextDisplay("player2");
			name1.moveTo(200, 450);
			name2.moveTo(500, 450);
			
			player1 = new ImageDisplay(Config.PLAYER);
			player2 = new ImageDisplay(Config.PLAYER);
			player1.moveTo(120, 50);
			player2.moveTo(450, 50);
		}
		
		private function addEntities():void {
			add(readyBtn1);
			add(readyBtn2);
			add(name1);
			add(name2);
			add(player1);
			add(player2);
		}
	}

}