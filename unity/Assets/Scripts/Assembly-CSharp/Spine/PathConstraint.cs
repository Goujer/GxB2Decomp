namespace Spine
{
	public class PathConstraint : IConstraint, IUpdatable
	{
		private const int NONE = -1;

		private const int BEFORE = -2;

		private const int AFTER = -3;

		private const float Epsilon = 1E-05f;

		internal PathConstraintData data;

		internal ExposedList<Bone> bones;

		internal Slot target;

		internal float position;

		internal float spacing;

		internal float rotateMix;

		internal float translateMix;

		internal ExposedList<float> spaces;

		internal ExposedList<float> positions;

		internal ExposedList<float> world;

		internal ExposedList<float> curves;

		internal ExposedList<float> lengths;

		internal float[] segments;

		public int Order
		{
			get
			{
				return 0;
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

		public ExposedList<Bone> Bones
		{
			get
			{
				return null;
			}
		}

		public Slot Target
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public PathConstraintData Data
		{
			get
			{
				return null;
			}
		}

		public PathConstraint(PathConstraintData data, Skeleton skeleton)
		{
		}

		public void Apply()
		{
		}

		public void Update()
		{
		}

		private float[] ComputeWorldPositions(PathAttachment path, int spacesCount, bool tangents, bool percentPosition, bool percentSpacing)
		{
			return null;
		}

		private static void AddBeforePosition(float p, float[] temp, int i, float[] output, int o)
		{
		}

		private static void AddAfterPosition(float p, float[] temp, int i, float[] output, int o)
		{
		}

		private static void AddCurvePosition(float p, float x1, float y1, float cx1, float cy1, float cx2, float cy2, float x2, float y2, float[] output, int o, bool tangents)
		{
		}
	}
}
