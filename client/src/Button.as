package  
{
	/**
	 * ...
	 * @author Lyudison
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	 
	public class Button extends ImageDisplay
	{	
		
		public function Button(type:Class = null) {
			super(type);
		}
		
		override public function update():void 
		{
			if (isClicked()) {
				trace("u have clicked button!");
			}
		}
		
		public function isClicked():Boolean {
			if(Input.mousePressed)
				if (Input.mouseX >= x && Input.mouseX <= x + width
					&&Input.mouseY >= y && Input.mouseY <= y + height)
					return true;
			return false;
		}
	}

}