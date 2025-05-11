namespace DragonBones
{
	internal abstract class BoneTimelineState : TweenTimelineState
	{
		public Bone bone;

		public BonePose bonePose;

		protected override void _OnClear()
		{
		}

		public void Blend(int state)
		{
		}
	}
}
