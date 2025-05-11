namespace DragonBones
{
	public abstract class DisplayData : BaseObject
	{
		public DisplayType type;

		public string name;

		public string path;

		public SkinData parent;

		public readonly Transform transform;

		protected override void _OnClear()
		{
		}
	}
}
