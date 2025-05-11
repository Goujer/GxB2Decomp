namespace HTMLEngine.NGUI
{
	public class NGUIImage : HtImage
	{
		private readonly bool isTime;

		private readonly HtFont timeFont;

		public readonly UIAtlas uiAtlas;

		public readonly string spriteName;

		public readonly bool isAnim;

		public readonly int FPS;

		private AbstractLoader _loader;

		public override int Width
		{
			get
			{
				return 0;
			}
		}

		public override int Height
		{
			get
			{
				return 0;
			}
		}

		public NGUIImage(string source, int fps)
		{
		}

		public override void Draw(string id, HtRect rect, HtColor color, string linkText, object userData)
		{
		}

		public void OnRelease()
		{
		}
	}
}
