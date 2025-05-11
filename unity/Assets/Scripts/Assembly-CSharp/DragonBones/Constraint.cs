namespace DragonBones
{
	internal abstract class Constraint : BaseObject
	{
		protected static readonly Matrix _helpMatrix;

		protected static readonly Transform _helpTransform;

		protected static readonly Point _helpPoint;

		internal ConstraintData _constraintData;

		protected Armature _armature;

		internal Bone _target;

		internal Bone _root;

		internal Bone _bone;

		public string name
		{
			get
			{
				return null;
			}
		}

		protected override void _OnClear()
		{
		}

		public abstract void Init(ConstraintData constraintData, Armature armature);

		public abstract void Update();

		public abstract void InvalidUpdate();
	}
}
