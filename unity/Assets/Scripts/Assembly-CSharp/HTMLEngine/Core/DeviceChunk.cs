namespace HTMLEngine.Core
{
	internal abstract class DeviceChunk : PoolableObject
	{
		public HtRect Rect;

		public HtFont Font;

		public int ExtraSpace;

		public int TotalWidth
		{
			get
			{
				return 0;
			}
		}

		public int TotalHeight
		{
			get
			{
				return 0;
			}
		}

		public abstract void Draw(float deltaTime, string linkText, object userData);

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public abstract void MeasureSize();

		public bool Contains(int x, int y)
		{
			return false;
		}
	}
}
