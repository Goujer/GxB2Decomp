using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class PointFollower : MonoBehaviour, IHasSkeletonRenderer, IHasSkeletonComponent
	{
		[SerializeField]
		public SkeletonRenderer skeletonRenderer;

		public string slotName;

		public string pointAttachmentName;

		public bool followRotation;

		public bool followSkeletonFlip;

		public bool followSkeletonZPosition;

		private Transform skeletonTransform;

		private bool skeletonTransformIsParent;

		private PointAttachment point;

		private Bone bone;

		private bool valid;

		public SkeletonRenderer SkeletonRenderer
		{
			get
			{
				return null;
			}
		}

		public ISkeletonComponent SkeletonComponent
		{
			get
			{
				return null;
			}
		}

		public bool IsValid
		{
			get
			{
				return false;
			}
		}

		public void Initialize()
		{
		}

		private void HandleRebuildRenderer(SkeletonRenderer skeletonRenderer)
		{
		}

		private void UpdateReferences()
		{
		}

		public void LateUpdate()
		{
		}
	}
}
