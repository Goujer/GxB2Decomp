using System;
using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	[DisallowMultipleComponent]
	public class BoneFollowerGraphic : MonoBehaviour
	{
		public SkeletonGraphic skeletonGraphic;

		public bool initializeOnAwake;

		[SerializeField]
		public string boneName;

		public bool followBoneRotation;

		public bool followSkeletonFlip;

		public bool followLocalScale;

		public bool followZPosition;

		[NonSerialized]
		public Bone bone;

		private Transform skeletonTransform;

		private bool skeletonTransformIsParent;

		[NonSerialized]
		public bool valid;

		public SkeletonGraphic SkeletonGraphic
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

		public void Initialize()
		{
		}

		public void LateUpdate()
		{
		}
	}
}
