namespace Spine.Unity.Playables
{
	public class SkeletonAnimationPlayableHandle : SpinePlayableHandleBase
	{
		public SkeletonAnimation skeletonAnimation;

		public override Skeleton Skeleton
		{
			get
			{
				return null;
			}
		}

		public override SkeletonData SkeletonData
		{
			get
			{
				return null;
			}
		}

		private void Awake()
		{
		}
	}
}
