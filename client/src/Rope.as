package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterType;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Graphic;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class Rope extends Entity
	{
		private var stretch:Boolean;
		private var fireSpeed:Number;
		private var waveSpeed:Number;
		private var length:Number;
		private var angle:Number;
		private var image:Image;
		private var isCatch:Boolean;
		
		public function Rope(x:Number = 0, y:Number = 0)
		{
			this.x = x;
			this.y = y;
			stretch = false;
			fireSpeed = Config.FIRE_SPEED;
			waveSpeed = Config.WAVE_SPEED;
			length = Config.ROPE_LENGTH;
			image = new Image(Config.ROPE, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
			image.originX = Config.ROPE_WIDTH / 2;
			graphic = image;
			setAngle(Config.WAVE_ANGLE_MIN);
			isCatch = false;
			
			setHitbox(Config.ROPE_WIDTH, length);
			type = "Rope";
		}
		
		override public function update():void 
		{
			//rope stretch
			if(stretch) {
				
				length = length + fireSpeed * FP.elapsed;
				if ( (angle<0&&length * Math.sin(-angle * 3.14 / 180) >= x) 
					|| (angle>=0&&length * Math.sin(Math.abs(angle) * 3.14 / 180) >= Config.RESOLUTION_WIDTH - x)
					|| length * Math.cos(angle * 3.14 / 180) >= Config.MINE_AREA_HEIGHT) {
					fireSpeed = -fireSpeed;
				}
				else if (fireSpeed < 0 && length <= Config.ROPE_LENGTH) {
					length = Config.ROPE_LENGTH;
					fireSpeed = -fireSpeed;
					stretch = false;
					isCatch = false;
				}
				if(!isCatch){
					if (collide("Stone",x,y)){
						fireSpeed = -fireSpeed;
						isCatch = true;
					}
				}
				setLength(length);
				//trace( width.toString() + ";" + height.toString());
			}
			//rope wave
			else {
				
				angle = angle + waveSpeed * FP.elapsed;
				if (angle <= Config.WAVE_ANGLE_MIN) {
					angle = Config.WAVE_ANGLE_MIN;
					waveSpeed = -waveSpeed;
				}
				else if (angle >= Config.WAVE_ANGLE_MAX) {
					angle = Config.WAVE_ANGLE_MAX;
					waveSpeed = -waveSpeed;
				}
				setAngle(angle);
			}
		}
		
		public function setStretch(state:Boolean = true):void {
			stretch = state;
		}
		
		public function setLength(distance:Number):void {
			length = distance;
			image = new Image(Config.ROPE, new Rectangle(0, Config.ROPE_MAX_LENGTH-length, Config.ROPE_WIDTH, length));
			image.originX = Config.ROPE_WIDTH / 2;
			image.angle = angle;
			graphic = image;
			if(!isCatch)
				setHitbox(Config.ROPE_WIDTH, length);
		}
		
		public function setAngle(angles:Number):void {
			angle = angles;
			image.angle = angle;
			graphic = image;
		}
		
		public function getAngle():Number {
			return angle;
		}
	}

}