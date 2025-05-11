namespace DragonBones
{
	public abstract class ConstraintData : BaseObject
	{
		public int order;

		public string name;

		public BoneData target;

		public BoneData root;

		public BoneData bone;

		protected override void _OnClear()
		{
		}
	}
}
