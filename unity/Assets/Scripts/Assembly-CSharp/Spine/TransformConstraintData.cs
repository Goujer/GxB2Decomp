namespace Spine
{
	public class TransformConstraintData
	{
		internal string name;

		internal int order;

		internal ExposedList<BoneData> bones;

		internal BoneData target;

		internal float rotateMix;

		internal float translateMix;

		internal float scaleMix;

		internal float shearMix;

		internal float offsetRotation;

		internal float offsetX;

		internal float offsetY;

		internal float offsetScaleX;

		internal float offsetScaleY;

		internal float offsetShearY;

		internal bool relative;

		internal bool local;

		public string Name
		{
			get
			{
				return null;
			}
		}

		public int Order
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public ExposedList<BoneData> Bones
		{
			get
			{
				return null;
			}
		}

		public BoneData Target
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float RotateMix
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float TranslateMix
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float ScaleMix
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float ShearMix
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetRotation
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetX
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetScaleX
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetScaleY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float OffsetShearY
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public bool Relative
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public bool Local
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public TransformConstraintData(string name)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
