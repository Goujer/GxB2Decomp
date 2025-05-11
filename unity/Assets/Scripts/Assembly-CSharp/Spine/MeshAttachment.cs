namespace Spine
{
	public class MeshAttachment : VertexAttachment, IHasRendererObject
	{
		internal float regionOffsetX;

		internal float regionOffsetY;

		internal float regionWidth;

		internal float regionHeight;

		internal float regionOriginalWidth;

		internal float regionOriginalHeight;

		private MeshAttachment parentMesh;

		internal float[] uvs;

		internal float[] regionUVs;

		internal int[] triangles;

		internal float r;

		internal float g;

		internal float b;

		internal float a;

		internal int hulllength;

		internal bool inheritDeform;

		internal int uv4x;

		internal int uv4y;

		internal int uv6x;

		internal int uv6y;

		public int HullLength
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float[] RegionUVs
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float[] UVs
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public int[] Triangles
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float R
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float G
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float B
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float A
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public string Path { get; set; }

		public object RendererObject { get; set; }

		public float RegionU { get; set; }

		public float RegionV { get; set; }

		public float RegionU2 { get; set; }

		public float RegionV2 { get; set; }

		public bool RegionRotate { get; set; }

		public float RegionOffsetX
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float RegionOffsetY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float RegionWidth
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float RegionHeight
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float RegionOriginalWidth
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float RegionOriginalHeight
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public bool InheritDeform
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public MeshAttachment ParentMesh
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public int[] Edges { get; set; }

		public float Width { get; set; }

		public float Height { get; set; }

		public MeshAttachment(string name)
			: base(null)
		{
		}

		public void UpdateUVs()
		{
		}

		public override bool ApplyDeform(VertexAttachment sourceAttachment)
		{
			return false;
		}

		public void SetPageIndex(int pageIndex)
		{
		}
	}
}
