namespace DragonBones
{
	public abstract class TextureData : BaseObject
	{
		public bool rotated;

		public string name;

		public readonly Rectangle region;

		public TextureAtlasData parent;

		public Rectangle frame;

		public static Rectangle CreateRectangle()
		{
			return null;
		}

		protected override void _OnClear()
		{
		}

		public virtual void CopyFrom(TextureData value)
		{
		}
	}
}
