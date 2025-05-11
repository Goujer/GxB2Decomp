namespace Spine
{
	public class VertexAttachment : Attachment
	{
		private static int nextID;

		private static readonly object nextIdLock;

		internal readonly int id;

		internal int[] bones;

		internal float[] vertices;

		internal int worldVerticesLength;

		public int Id
		{
			get
			{
				return 0;
			}
		}

		public int[] Bones
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float[] Vertices
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public int WorldVerticesLength
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public VertexAttachment(string name)
			: base(null)
		{
		}

		public void ComputeWorldVertices(Slot slot, float[] worldVertices)
		{
		}

		public void ComputeWorldVertices(Slot slot, int start, int count, float[] worldVertices, int offset, int stride = 2)
		{
		}

		public virtual bool ApplyDeform(VertexAttachment sourceAttachment)
		{
			return false;
		}
	}
}
