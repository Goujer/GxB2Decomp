using System.Collections;
using System.Diagnostics;
using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonGhostRenderer : MonoBehaviour
	{
		public float fadeSpeed;

		private Color32[] colors;

		private Color32 black;

		private MeshFilter meshFilter;

		private MeshRenderer meshRenderer;

		private void Awake()
		{
		}

		public void Initialize(Mesh mesh, Material[] materials, Color32 color, bool additive, float speed, int sortingLayerID, int sortingOrder)
		{
		}

		[DebuggerHidden]
		private IEnumerator Fade()
		{
			return null;
		}

		[DebuggerHidden]
		private IEnumerator FadeAdditive()
		{
			return null;
		}

		public void Cleanup()
		{
		}
	}
}
