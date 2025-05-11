namespace DragonBones
{
	public class BoneData : BaseObject
	{
		public bool inheritTranslation;

		public bool inheritRotation;

		public bool inheritScale;

		public bool inheritReflection;

		public float length;

		public string name;

		public readonly Transform transform;

		public UserData userData;

		public BoneData parent;

		protected override void _OnClear()
		{
		}
	}
}
