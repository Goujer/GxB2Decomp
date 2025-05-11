using UnityEngine;
using UnityEngine.UI;

namespace DragonBones
{
	[DisallowMultipleComponent]
	[ExecuteInEditMode]
	public class UnityUGUIDisplay : MaskableGraphic
	{
		[HideInInspector]
		public Mesh sharedMesh;

		private Texture _texture;

		public override Texture mainTexture
		{
			get
			{
				return null;
			}
		}

		public Texture texture
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		protected override void OnPopulateMesh(VertexHelper vh)
		{
		}

		public override void Rebuild(CanvasUpdate update)
		{
		}

		private void Update()
		{
		}
	}
}
