using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonUtilityKinematicShadow : MonoBehaviour
	{
		private struct TransformPair
		{
			public Transform dest;

			public Transform src;
		}

		public enum PhysicsSystem
		{
			Physics2D = 0,
			Physics3D = 1
		}

		public bool detachedShadow;

		public Transform parent;

		public bool hideShadow;

		public PhysicsSystem physicsSystem;

		private GameObject shadowRoot;

		private readonly List<TransformPair> shadowTable;

		private void Start()
		{
		}

		private static void DestroyComponents(Component[] components)
		{
		}

		private void FixedUpdate()
		{
		}
	}
}
