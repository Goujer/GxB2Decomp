namespace DragonBones
{
	public abstract class TransformObject : BaseObject
	{
		protected static readonly Matrix _helpMatrix;

		protected static readonly Transform _helpTransform;

		protected static readonly Point _helpPoint;

		public readonly Matrix globalTransformMatrix;

		public readonly Transform global;

		public readonly Transform offset;

		public Transform origin;

		public object userData;

		protected bool _globalDirty;

		internal Armature _armature;

		public Armature armature
		{
			get
			{
				return null;
			}
		}

		protected override void _OnClear()
		{
		}

		public void UpdateGlobalTransform()
		{
		}
	}
}
