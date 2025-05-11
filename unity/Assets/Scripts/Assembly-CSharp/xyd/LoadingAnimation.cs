using System.Collections.Generic;
using UnityEngine;

namespace xyd
{
	public class LoadingAnimation : MonoBehaviour
	{
		public GameObject BackGround;

		public GameObject LoadingMan;

		public List<GameObject> Pendants;

		private Vector3 _finalBackPosition;

		private Vector3 _finalManPosition;

		public Vector3 BackPosition
		{
			get
			{
				return default(Vector3);
			}
			set
			{
			}
		}

		public Vector3 ManPosition
		{
			get
			{
				return default(Vector3);
			}
			set
			{
			}
		}

		public void AddPendant(GameObject obj)
		{
		}

		private void Update()
		{
		}
	}
}
