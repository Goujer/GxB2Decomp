namespace HTMLEngine.Core
{
	internal class HtmlChunkWord : HtmlChunk
	{
		public string Text;

		public bool ReadWord(Reader reader)
		{
			return false;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
