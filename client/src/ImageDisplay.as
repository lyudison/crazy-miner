package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class ImageDisplay extends Entity
	{
		public function ImageDisplay(x:Number = 0, y:Number = 0, image:Class = null)
		{
			var img:Image;
			if (!image)
				img = Image.createCircle(20, 0xff0000);
			else 
				img = new Image(image);
			super(x, y, img);
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}