using System;
using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class BoneFollower : MonoBehaviour
	{
		public SkeletonRenderer skeletonRenderer;

		[SerializeField]
		public string boneName;

		public bool followZPosition;

		public bool followBoneRotation;

		public bool followSkeletonFlip;

		public bool followLocalScale;

		public bool initializeOnAwake;

		[NonSerialized]
		public bool valid;

		[NonSerialized]
		public Bone bone;

		private Transform skeletonTransform;

		private bool skeletonTransformIsParent;

		public SkeletonRenderer SkeletonRenderer
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public bool SetBone(string name)
		{
			return false;
		}

		public void Awake()
		{
		}

		public void HandleRebuildRenderer(SkeletonRenderer skeletonRenderer)
		{
		}

		public void Initialize()
		{
		}

		private void OnDestroy()
		{
		}

		public void LateUpdate()
		{
		}
	}
}
