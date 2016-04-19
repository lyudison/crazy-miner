package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Stone extends Entity
	{
		private var kind:int;
		private var speed_x:Number;
		private var speed_y:Number;
		private var isCatched:Boolean;
		
		public function Stone(x:int=0,y:int=0,kind:int=-1) 
		{
			this.x = x;
			this.y = y;
			speed_x = speed_y = 0;
			isCatched = false;
			this.kind = kind;
			if(kind==-1)
				graphic = Image.createCircle(20, 0xff0000);
			
			setHitbox(40, 40);
		}
		
		override public function update():void 
		{
			/*
			if (!isCatched) {
				var r:Rope = collide("Rope", x, y) as Rope;
				if (r) {
					trace("stone:x=" + x.toString() + ";y=" + y.toString());
					var angle:Number = Math.atan2(centerY - r.originY, r.originX - centerX);
					speed_x = Config.FIRE_SPEED * Math.cos(angle);
					speed_y = - Config.FIRE_SPEED * Math.sin(angle);
					isCatched = true;
				}
			}
			else {
				//trace("catch!!");
				moveTo(x + speed_x * FP.elapsed, y + speed_y * FP.elapsed);
				if (y <= Config.PLAYER_AREA_HEIGHT) {
					FP.world.remove(this);
				}
			}
			*/
		}
	}

}