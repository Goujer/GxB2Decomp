namespace DragonBones
{
	internal class BonePose : BaseObject
	{
		public readonly Transform current;

		public readonly Transform delta;

		public readonly Transform result;

		protected override void _OnClear()
		{
		}
	}
}
