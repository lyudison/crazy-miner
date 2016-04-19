package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Lyudison
	 */
	public class TextDisplay extends Entity
	{
		private var content:String = "NO TEXT!";
		
		public function TextDisplay(str:String = null) 
		{
			if(str)
				content = str;	
			graphic = new Text(content);
		}
		
		public function setText(text:String):void {
			content = text;
		}
		
		override public function update():void 
		{
			graphic = new Text(content);
		}
	}

}