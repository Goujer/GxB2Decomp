using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonGhost : MonoBehaviour
	{
		private const HideFlags GhostHideFlags = HideFlags.HideInHierarchy;

		private const string GhostingShaderName = "Spine/Special/SkeletonGhost";

		public bool ghostingEnabled;

		public float spawnRate;

		public Color32 color;

		public bool additive;

		public int maximumGhosts;

		public float fadeSpeed;

		public Shader ghostShader;

		public float textureFade;

		public bool sortWithDistanceOnly;

		public float zOffset;

		private float nextSpawnTime;

		private SkeletonGhostRenderer[] pool;

		private int poolIndex;

		private SkeletonRenderer skeletonRenderer;

		private MeshRenderer meshRenderer;

		private MeshFilter meshFilter;

		private readonly Dictionary<Material, Material> materialTable;

		private void Start()
		{
		}

		private void OnEvent(TrackEntry trackEntry, Event e)
		{
		}

		private void Ghosting(float val)
		{
		}

		private void Update()
		{
		}

		private void OnDestroy()
		{
		}

		private static Color32 HexToColor(string hex)
		{
			return default(Color32);
		}
	}
}
