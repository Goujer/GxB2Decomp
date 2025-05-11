using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	public class SkeletonUtility : MonoBehaviour
	{
		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void SkeletonUtilityDelegate();

		public Transform boneRoot;

		[HideInInspector]
		public SkeletonRenderer skeletonRenderer;

		[HideInInspector]
		public ISkeletonAnimation skeletonAnimation;

		[NonSerialized]
		public List<SkeletonUtilityBone> utilityBones;

		[NonSerialized]
		public List<SkeletonUtilityConstraint> utilityConstraints;

		protected bool hasTransformBones;

		protected bool hasUtilityConstraints;

		protected bool needToReprocessBones;

		public event SkeletonUtilityDelegate OnReset
		{
			add
			{
			}
			remove
			{
			}
		}

		public static PolygonCollider2D AddBoundingBoxGameObject(Skeleton skeleton, string skinName, string slotName, string attachmentName, Transform parent, bool isTrigger = true)
		{
			return null;
		}

		public static PolygonCollider2D AddBoundingBoxGameObject(string name, BoundingBoxAttachment box, Slot slot, Transform parent, bool isTrigger = true)
		{
			return null;
		}

		public static PolygonCollider2D AddBoundingBoxAsComponent(BoundingBoxAttachment box, Slot slot, GameObject gameObject, bool isTrigger = true, bool isKinematic = true, float gravityScale = 0f)
		{
			return null;
		}

		public static void SetColliderPointsLocal(PolygonCollider2D collider, Slot slot, BoundingBoxAttachment box)
		{
		}

		public static Bounds GetBoundingBoxBounds(BoundingBoxAttachment boundingBox, float depth = 0f)
		{
			return default(Bounds);
		}

		private void Update()
		{
		}

		private void OnEnable()
		{
		}

		private void Start()
		{
		}

		private void OnDisable()
		{
		}

		private void HandleRendererReset(SkeletonRenderer r)
		{
		}

		public void RegisterBone(SkeletonUtilityBone bone)
		{
		}

		public void UnregisterBone(SkeletonUtilityBone bone)
		{
		}

		public void RegisterConstraint(SkeletonUtilityConstraint constraint)
		{
		}

		public void UnregisterConstraint(SkeletonUtilityConstraint constraint)
		{
		}

		public void CollectBones()
		{
		}

		private void UpdateLocal(ISkeletonAnimation anim)
		{
		}

		private void UpdateWorld(ISkeletonAnimation anim)
		{
		}

		private void UpdateComplete(ISkeletonAnimation anim)
		{
		}

		private void UpdateAllBones(SkeletonUtilityBone.UpdatePhase phase)
		{
		}

		public Transform GetBoneRoot()
		{
			return null;
		}

		public GameObject SpawnRoot(SkeletonUtilityBone.Mode mode, bool pos, bool rot, bool sca)
		{
			return null;
		}

		public GameObject SpawnHierarchy(SkeletonUtilityBone.Mode mode, bool pos, bool rot, bool sca)
		{
			return null;
		}

		public GameObject SpawnBoneRecursively(Bone bone, Transform parent, SkeletonUtilityBone.Mode mode, bool pos, bool rot, bool sca)
		{
			return null;
		}

		public GameObject SpawnBone(Bone bone, Transform parent, SkeletonUtilityBone.Mode mode, bool pos, bool rot, bool sca)
		{
			return null;
		}
	}
}
