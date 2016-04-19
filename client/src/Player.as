package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Player extends Entity
	{
		public var header:ImageDisplay;
		public var platform:ImageDisplay;
		public var rope:Rope;
		public var playerName:String;
		public var endX:Number;
		public var endY:Number;
		public var endTime:Number;
		public var backTime:Number;
		
		public function Player(position_x:Number = 0, position_y:Number = 0) 
		{
			super(position_x, position_y);
			header = new ImageDisplay(centerX - Config.PLAYER_WIDTH / 2, y + Config.PLAYER_HEIGHT - Config.PLAYER_HEIGHT,Config.PLAYER);
			platform = new ImageDisplay(centerX - Config.PLATFORM_WIDTH / 2, y + Config.PLAYER_HEIGHT - Config.PLATFORM_HEIGHT,Config.PLATFORM);
			rope = new Rope(centerX, y + Config.PLAYER_HEIGHT);
		}
		
	}

}