using System.Collections.Generic;

namespace HTMLEngine.Core
{
	internal class DeviceChunkLine : PoolableObject
	{
		public bool IsFull;

		public int Y;

		public int MaxWidth;

		public int Width;

		public int Height;

		public string Dir;

		private readonly List<DeviceChunk> list;

		public List<DeviceChunk> Chunks
		{
			get
			{
				return null;
			}
		}

		public int AvailWidth
		{
			get
			{
				return 0;
			}
		}

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public void Clear(bool releaseItems = true)
		{
		}

		public bool AddChunk(DeviceChunk chunk, bool prevIsWord)
		{
			return false;
		}

		public bool AddChunkL(DeviceChunk chunk, bool prevIsWord)
		{
			return false;
		}

		public bool AddChunkR(DeviceChunk chunk, bool prevIsWord)
		{
			return false;
		}

		public void HorzAlign(TextAlign align)
		{
		}

		public void VertAlign(VertAlign align)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
