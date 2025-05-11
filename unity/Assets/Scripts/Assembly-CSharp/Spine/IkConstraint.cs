namespace Spine
{
	public class IkConstraint : IConstraint, IUpdatable
	{
		internal IkConstraintData data;

		internal ExposedList<Bone> bones;

		internal Bone target;

		internal float mix;

		internal int bendDirection;

		public IkConstraintData Data
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

		public int BendDirection
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float Mix
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public IkConstraint(IkConstraintData data, Skeleton skeleton)
		{
		}

		public void Apply()
		{
		}

		public void Update()
		{
		}

		public override string ToString()
		{
			return null;
		}

		public static void Apply(Bone bone, float targetX, float targetY, float alpha)
		{
		}

		public static void Apply(Bone parent, Bone child, float targetX, float targetY, int bendDir, float alpha)
		{
		}
	}
}
