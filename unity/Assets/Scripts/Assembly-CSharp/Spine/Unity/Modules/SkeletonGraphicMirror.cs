using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonGraphicMirror : MonoBehaviour
	{
		public SkeletonRenderer source;

		public bool mirrorOnStart;

		public bool restoreOnDisable;

		private SkeletonGraphic skeletonGraphic;

		private Skeleton originalSkeleton;

		private bool originalFreeze;

		private Texture2D overrideTexture;

		private void Awake()
		{
		}

		private void Start()
		{
		}

		private void LateUpdate()
		{
		}

		private void OnDisable()
		{
		}

		public void StartMirroring()
		{
		}

		public void UpdateTexture(Texture2D newOverrideTexture)
		{
		}

		public void RestoreIndependentSkeleton()
		{
		}
	}
}
