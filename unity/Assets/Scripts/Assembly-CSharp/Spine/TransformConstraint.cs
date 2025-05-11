namespace Spine
{
	public class TransformConstraint : IConstraint, IUpdatable
	{
		internal TransformConstraintData data;

		internal ExposedList<Bone> bones;

		internal Bone target;

		internal float rotateMix;

		internal float translateMix;

		internal float scaleMix;

		internal float shearMix;

		public TransformConstraintData Data
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
		}

		public ExposedList<Bone> Bones
		{
			get
			{
				return null;
			}
		}

		public Bone Target
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

		public TransformConstraint(TransformConstraintData data, Skeleton skeleton)
		{
		}

		public void Apply()
		{
		}

		public void Update()
		{
		}

		private void ApplyAbsoluteWorld()
		{
		}

		private void ApplyRelativeWorld()
		{
		}

		private void ApplyAbsoluteLocal()
		{
		}

		private void ApplyRelativeLocal()
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
