namespace HTMLEngine.Core
{
	internal class DeviceChunkDrawImage : DeviceChunk
	{
		public HtImage Image;

		public HtColor Color;

		public string Id;

		public override void Draw(float deltaTime, string linkText, object userData)
		{
		}

		public override void MeasureSize()
		{
		}
	}
}
