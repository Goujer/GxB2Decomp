namespace HTMLEngine.Core
{
	internal class DeviceChunkDrawText : DeviceChunk
	{
		public DrawTextDeco Deco;

		public bool DecoStop;

		public HtColor Color;

		public string Text;

		public string Id;

		public bool PrevIsWord;

		public override void Draw(float deltaTime, string linkText, object userData)
		{
		}

		public override void MeasureSize()
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
