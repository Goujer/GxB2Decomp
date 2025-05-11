using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonRagdoll2D : MonoBehaviour
	{
		private static Transform parentSpaceHelper;

		public string startingBoneName;

		public List<string> stopBoneNames;

		public bool applyOnStart;

		public bool disableIK;

		public bool disableOtherConstraints;

		[Space]
		public bool pinStartBone;

		public float gravityScale;

		public float thickness;

		public float rotationLimit;

		public float rootMass;

		public float massFalloffFactor;

		[SkeletonRagdoll.LayerField]
		public int colliderLayer;

		public float mix;

		private ISkeletonAnimation targetSkeletonComponent;

		private Skeleton skeleton;

		private Dictionary<Bone, Transform> boneTable;

		private Transform ragdollRoot;

		private Vector2 rootOffset;

		private bool isActive;

		public Rigidbody2D RootRigidbody { get; private set; }

		public Bone StartingBone { get; private set; }

		public Vector3 RootOffset
		{
			get
			{
				return default(Vector3);
			}
		}

		public bool IsActive
		{
			get
			{
				return false;
			}
		}

		public Rigidbody2D[] RigidbodyArray
		{
			get
			{
				return null;
			}
		}

		public Vector3 EstimatedSkeletonPosition
		{
			get
			{
				return default(Vector3);
			}
		}

		[DebuggerHidden]
		private IEnumerator Start()
		{
			return null;
		}

		public void Apply()
		{
		}

		public Coroutine SmoothMix(float target, float duration)
		{
			return null;
		}

		[DebuggerHidden]
		private IEnumerator SmoothMixCoroutine(float target, float duration)
		{
			return null;
		}

		public void SetSkeletonPosition(Vector3 worldPosition)
		{
		}

		public void Remove()
		{
		}

		public Rigidbody2D GetRigidbody(string boneName)
		{
			return null;
		}

		private void RecursivelyCreateBoneProxies(Bone b)
		{
		}

		private void UpdateSpineSkeleton(ISkeletonAnimation animatedSkeleton)
		{
		}

		private static List<Collider2D> AttachBoundingBoxRagdollColliders(Bone b, GameObject go, Skeleton skeleton, float gravityScale)
		{
			return null;
		}

		private static float GetPropagatedRotation(Bone b)
		{
			return 0f;
		}

		private static Vector3 FlipScale(bool flipX, bool flipY)
		{
			return default(Vector3);
		}
	}
}
