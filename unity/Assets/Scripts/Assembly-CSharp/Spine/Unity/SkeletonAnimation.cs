using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class SkeletonAnimation : SkeletonRenderer, ISkeletonAnimation, IAnimationStateComponent
	{
		public AnimationState state;

		[SerializeField]
		private string _animationName;

		public bool loop;

		public float timeScale;

		public AnimationState AnimationState
		{
			get
			{
				return null;
			}
		}

		public string AnimationName
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		protected event UpdateBonesDelegate _UpdateLocal
		{
			add
			{
			}
			remove
			{
			}
		}

		protected event UpdateBonesDelegate _UpdateWorld
		{
			add
			{
			}
			remove
			{
			}
		}

		protected event UpdateBonesDelegate _UpdateComplete
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateLocal
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateWorld
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateComplete
		{
			add
			{
			}
			remove
			{
			}
		}

		private TrackEntry TrySetAnimation(string animationName, bool animationLoop)
		{
			return null;
		}

		public static SkeletonAnimation AddToGameObject(GameObject gameObject, SkeletonDataAsset skeletonDataAsset)
		{
			return null;
		}

		public static SkeletonAnimation NewSkeletonAnimationGameObject(SkeletonDataAsset skeletonDataAsset)
		{
			return null;
		}

		public override void ClearState()
		{
		}

		public override void Initialize(bool overwrite)
		{
		}

		private void Update()
		{
		}

		public void Update(float deltaTime)
		{
		}
	}
}
