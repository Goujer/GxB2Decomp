namespace Spine
{
	public class PathConstraintData
	{
		internal string name;

		internal int order;

		internal ExposedList<BoneData> bones;

		internal SlotData target;

		internal PositionMode positionMode;

		internal SpacingMode spacingMode;

		internal RotateMode rotateMode;

		internal float offsetRotation;

		internal float position;

		internal float spacing;

		internal float rotateMix;

		internal float translateMix;

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

		public SlotData Target
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public PositionMode PositionMode
		{
			get
			{
				return default(PositionMode);
			}
			set
			{
			}
		}

		public SpacingMode SpacingMode
		{
			get
			{
				return default(SpacingMode);
			}
			set
			{
			}
		}

		public RotateMode RotateMode
		{
			get
			{
				return default(RotateMode);
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

		public float Position
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Spacing
		{
			get
			{
				return 0f;
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

		public PathConstraintData(string name)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
