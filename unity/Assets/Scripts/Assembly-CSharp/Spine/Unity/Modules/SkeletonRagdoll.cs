using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonRagdoll : MonoBehaviour
	{
		public class LayerFieldAttribute : PropertyAttribute
		{
		}

		private static Transform parentSpaceHelper;

		public string startingBoneName;

		public List<string> stopBoneNames;

		public bool applyOnStart;

		public bool disableIK;

		public bool disableOtherConstraints;

		[Space]
		public bool pinStartBone;

		public bool enableJointCollision;

		public bool useGravity;

		public float thickness;

		public float rotationLimit;

		public float rootMass;

		public float massFalloffFactor;

		public int colliderLayer;

		public float mix;

		private ISkeletonAnimation targetSkeletonComponent;

		private Skeleton skeleton;

		private Dictionary<Bone, Transform> boneTable;

		private Transform ragdollRoot;

		private Vector3 rootOffset;

		private bool isActive;

		public Rigidbody RootRigidbody { get; private set; }

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

		public Rigidbody[] RigidbodyArray
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

		public Rigidbody GetRigidbody(string boneName)
		{
			return null;
		}

		private void RecursivelyCreateBoneProxies(Bone b)
		{
		}

		private void UpdateSpineSkeleton(ISkeletonAnimation skeletonRenderer)
		{
		}

		private List<Collider> AttachBoundingBoxRagdollColliders(Bone b)
		{
			return null;
		}

		private static float GetPropagatedRotation(Bone b)
		{
			return 0f;
		}
	}
}
