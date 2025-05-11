namespace Spine
{
	public class BoneData
	{
		internal int index;

		internal string name;

		internal BoneData parent;

		internal float length;

		internal float x;

		internal float y;

		internal float rotation;

		internal float scaleX;

		internal float scaleY;

		internal float shearX;

		internal float shearY;

		internal TransformMode transformMode;

		public int Index
		{
			get
			{
				return 0;
			}
		}

		public string Name
		{
			get
			{
				return null;
			}
		}

		public BoneData Parent
		{
			get
			{
				return null;
			}
		}

		public float Length
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

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

		public float ShearX
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float ShearY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public TransformMode TransformMode
		{
			get
			{
				return default(TransformMode);
			}
			set
			{
			}
		}

		public BoneData(int index, string name, BoneData parent)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
