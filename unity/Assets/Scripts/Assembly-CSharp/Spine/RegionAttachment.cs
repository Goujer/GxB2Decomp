namespace Spine
{
	public class RegionAttachment : Attachment, IHasRendererObject
	{
		public const int BLX = 0;

		public const int BLY = 1;

		public const int ULX = 2;

		public const int ULY = 3;

		public const int URX = 4;

		public const int URY = 5;

		public const int BRX = 6;

		public const int BRY = 7;

		internal float x;

		internal float y;

		internal float rotation;

		internal float scaleX;

		internal float scaleY;

		internal float width;

		internal float height;

		internal float regionOffsetX;

		internal float regionOffsetY;

		internal float regionWidth;

		internal float regionHeight;

		internal float regionOriginalWidth;

		internal float regionOriginalHeight;

		internal float[] offset;

		internal float[] uvs;

		internal float r;

		internal float g;

		internal float b;

		internal float a;

		internal int uv4x;

		internal int uv4y;

		internal int uv6x;

		internal int uv6y;

		public float X
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Y
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Rotation
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float ScaleX
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float ScaleY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Width
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Height
		{
			get
			{
				return 0f;
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

		public float[] Offset
		{
			get
			{
				return null;
			}
		}

		public float[] UVs
		{
			get
			{
				return null;
			}
		}

		public RegionAttachment(string name)
			: base(null)
		{
		}

		public void UpdateOffset()
		{
		}

		public void SetUVs(float u, float v, float u2, float v2, bool rotate)
		{
		}

		public void SetPageIndex(int pageIndex)
		{
		}

		public void ComputeWorldVertices(Bone bone, float[] worldVertices, int offset, int stride = 2)
		{
		}
	}
}
