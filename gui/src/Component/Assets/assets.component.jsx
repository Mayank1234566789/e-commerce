import React from 'react';
import '../Assets/assets.component.css';


const Assets = ({ id, name, price, imageUrl }) => (

    <div className='assets-item'>
        <div className='image'
            style={{
                backgroundImage: `url(${imageUrl})`
            }}
        />
        
        <div className='assets-footer'>
            <span className='name'>{name}</span>
            <span className='price'>{price}</span>
        </div>
    </div>
)



export default Assets;