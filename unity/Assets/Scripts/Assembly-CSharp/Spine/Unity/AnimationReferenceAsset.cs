using UnityEngine;

namespace Spine.Unity
{
	[CreateAssetMenu]
	public class AnimationReferenceAsset : ScriptableObject, IHasSkeletonDataAsset
	{
		private const bool QuietSkeletonData = true;

		[SerializeField]
		protected SkeletonDataAsset skeletonDataAsset;

		[SerializeField]
		protected string animationName;

		private Animation animation;

		public SkeletonDataAsset SkeletonDataAsset
		{
			get
			{
				return null;
			}
		}

		public Animation Animation
		{
			get
			{
				return null;
			}
		}

		public void Initialize()
		{
		}

		public static implicit operator Animation(AnimationReferenceAsset asset)
		{
			return null;
		}
	}
}
